package com.infosys.GymManagementSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.infosys.GymManagementSystem.bean.GymItem;
import com.infosys.GymManagementSystem.bean.Item;
import com.infosys.GymManagementSystem.bean.Slot;
import com.infosys.GymManagementSystem.bean.SlotItem;
import com.infosys.GymManagementSystem.bean.SlotItemEmbed;
import com.infosys.GymManagementSystem.dao.GymItemDao;
import com.infosys.GymManagementSystem.dao.SlotDao;
import com.infosys.GymManagementSystem.dao.SlotItemDao;
import com.infosys.GymManagementSystem.exception.SeatNotAvailableException;
import com.infosys.GymManagementSystem.service.GymItemService;
import com.infosys.GymManagementSystem.service.GymUserService;

@RestController
public class GymController {
	@Autowired
	private GymItemDao gymItemDao;
	@Autowired
	private SlotDao slotDao;
	@Autowired
	private SlotItemDao slotItemDao;

	@Autowired
	private GymItemService itemService;
	
	@Autowired
	private GymUserService userService;
	
	@GetMapping("/index")
	public ModelAndView showIndex() {
		String indexPage= "";
		String usertype=userService.getType();
		if(usertype.equalsIgnoreCase("Admin"))
			indexPage="index1";
		else if(usertype.equalsIgnoreCase("Customer"))
			indexPage="index2";
		
		return new ModelAndView(indexPage);
	}
	
	 
	@GetMapping("/gymitem")
	public ModelAndView showItemEntryPage() {
		GymItem gymItem= new GymItem();
		Long newId=gymItemDao.generateItemId();
		gymItem.setItemId(newId);
		ModelAndView mv = new ModelAndView("gymItemEntryPage");
		mv.addObject("itemRecord",gymItem);
		
		return mv;
	}
	
		
	@PostMapping("/gymitem")
	public ModelAndView saveItem(@ModelAttribute("itemRecord") GymItem gymItem,HttpSession session) {
		gymItemDao.saveNewItem(gymItem);
		session.setAttribute("message", "Item added successfully!");
		return new ModelAndView("redirect:/index");
	}
	
	
	@GetMapping("/gymitems")
	public ModelAndView showItemReportPage() {
		List<GymItem> itemList=gymItemDao.displayAllItems();
		ModelAndView mv=new ModelAndView("gymItemReportPage");
		mv.addObject("itemList",itemList);
		return mv;
	}
	@GetMapping("/slot")
	public ModelAndView showSlotEntryPage() {
		Slot slot= new Slot();
		Long newId=slotDao.generateSlotId();
		slot.setSlotId(newId);
		ModelAndView mv = new ModelAndView("slotEntryPage");
		mv.addObject("slotRecord",slot);
		return mv;	
	}	
	@PostMapping("/slot")
	public ModelAndView saveSlot(@ModelAttribute("slotRecord") Slot slotItem,HttpSession session) {
		slotDao.saveNewSlot(slotItem);
		List<GymItem> itemList=gymItemDao.displayAllItems();
		for(GymItem item:itemList) {
			SlotItemEmbed embed = new SlotItemEmbed(slotItem.getSlotId(),item.getItemId());
			SlotItem slot=new SlotItem(embed);
			slotItemDao.save(slot);
			System.out.println("hello");
		} 
	
		session.setAttribute("message", "Slot added successfully!");
		return new ModelAndView("redirect:/index");
	}
	@GetMapping("/slots")
	public ModelAndView showSlotReportPage() {
		List<Slot> slotList=slotDao.displayAllSlot();
		ModelAndView mv=new ModelAndView("slotReportPage");
		mv.addObject("slotList",slotList);
		return mv;
	}
	@GetMapping("/slot-show/{id}")
	public ModelAndView showSlotBookingPage(@PathVariable Long id){
    	Slot slot=slotDao.findSlotById(id);
    	List<Item> itemList=itemService.getItemList(id);
    	ModelAndView mv=new ModelAndView("slotBookPage");
    	mv.addObject("slot", slot);
    	mv.addObject("itemList",itemList);
    	
    	return mv;
    }
	@GetMapping("/slot-item-add/{id}") 
	public ModelAndView saveItemSlots(@PathVariable Long id) {
		itemService.addNewItemToSlots(id);
		return new ModelAndView("redirect:/index");
	}
	
	@PostMapping("/bookSlot")
    public ModelAndView bookSlot(@RequestParam("slot_id") Long slotId,@RequestParam("selectItem") Long itemId,HttpSession session) {
		GymItem gymItem = gymItemDao.findItemsById(itemId);
        SlotItemEmbed embedId = new SlotItemEmbed(slotId, itemId);
        SlotItem slotItem = slotItemDao.findItemById(embedId);
        int totalSeat = gymItem.getTotalSeat();
        int currentSeatBooked = slotItem.getSeatBooked();
        int available = totalSeat-currentSeatBooked;
        if(available>0) {
        slotItem.setSeatBooked(currentSeatBooked+1);
        slotItemDao.save(slotItem);
        session.setAttribute("message", "Slot booked successfully!");
        }
        else {
        	throw new SeatNotAvailableException();
        }
        
        return new ModelAndView("redirect:/index");
    }
	
	@GetMapping("/x") 
	public ModelAndView index() {
		ModelAndView mv=new ModelAndView("index");
		return mv;
	}
	
}
	

		
		

	
	
	
