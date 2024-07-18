package com.infosys.GymManagementSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.infosys.GymManagementSystem.bean.GymBook;
import com.infosys.GymManagementSystem.bean.GymItem;
import com.infosys.GymManagementSystem.bean.GymUser;
import com.infosys.GymManagementSystem.bean.Item;
import com.infosys.GymManagementSystem.bean.Slot;
import com.infosys.GymManagementSystem.bean.SlotItem;
import com.infosys.GymManagementSystem.bean.SlotItemEmbed;
import com.infosys.GymManagementSystem.dao.GymBookDao;
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
	private GymBookDao gymBookDao;

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
	
	@GetMapping("/slot-item-add/{id}") 
	public ModelAndView saveItemSlots(@PathVariable Long id) {
		itemService.addNewItemToSlots(id);
		return new ModelAndView("redirect:/index");
	}
	
	@GetMapping("/slot-book/{id}")
	public ModelAndView showSlotBookPage(@PathVariable Long id){
	String fname="";
	String userType=userService.getType();
	if(userType.equalsIgnoreCase("Admin"))
			fname="slotBookPageAdmin";
	else if (userType.equalsIgnoreCase("Customer"))
			fname="slotBookPageCustomer";	
	
	
	Slot slot=slotDao.findSlotById(id);
	List<Item> itemList=itemService.getItemList(id);
	ModelAndView mv= new ModelAndView(fname);
	mv.addObject("slot",slot);
	mv.addObject("itemList", itemList);
	if(userType.equalsIgnoreCase("Admin")){
		List<String> userList=userService.getAllCustomer();
		//userList.forEach(u->System.out.println(u));
		mv.addObject("userList",userList);
	}
	return mv;
}
	
	@GetMapping("/adminBookingDeatils")
	public ModelAndView showAdminBooking() {
		List<GymBook> bookList=gymBookDao.getBookList();
		ModelAndView mv=new ModelAndView("AdminBookingDetails");
		mv.addObject("bookList",bookList);
		return mv;
	}
	
	 @GetMapping("/customerBookingDetails")
	    public ModelAndView showCustomerBookings() {
	        String username = userService.getUser().getUsername();
	        List<GymBook> customerBookings = gymBookDao.findBookingsByUsername(username);
	        ModelAndView mv = new ModelAndView("CustomerBookingDetails");
	        mv.addObject("bookings", customerBookings);
	        return mv;
	    }

	 @GetMapping("/cancel-booking/{id}")
	    public ModelAndView cancelBooking(@PathVariable Long id) {
	        gymBookDao.deleteById(id);
	        
	       
	        ModelAndView mv = new ModelAndView("bookingCancellationSuccess");
	        mv.addObject("message", "Booking has been cancelled successfully!");
	        return mv;
	    }
	
       
        
      
	
	@PostMapping("/slot-book")
	public ModelAndView bookSlot(@RequestParam("slot_id") Long slotId, @RequestParam("selectItem") Long itemId, @RequestParam("userId") String userId, Model model) {
	    GymItem gymItem = gymItemDao.findItemsById(itemId);
	    SlotItemEmbed embedId = new SlotItemEmbed(slotId, itemId);
	    SlotItem slotItem = slotItemDao.findItemById(embedId);
	    int totalSeat = gymItem.getTotalSeat();
	    int currentSeatBooked = slotItem.getSeatBooked();
	    int available = totalSeat - currentSeatBooked;
	    GymBook gymBook = null;

	    if (available > 0) {
	        Long bookingId = gymBookDao.generateBookingId();
	        slotItem.setSeatBooked(currentSeatBooked + 1);
	        String customerId = "";
	        if (userId.equals("0"))
	            customerId = userService.getUser().getUsername();
	        else
	            customerId = userId;
	        gymBook = new GymBook(bookingId, slotId, itemId, customerId);

	        gymBookDao.save(gymBook);
	        slotItemDao.save(slotItem);

	        model.addAttribute("message", "Slot booked successfully!");
	        model.addAttribute("booking", gymBook);
	    } else {
	        throw new SeatNotAvailableException();
	    }
	    
	    return new ModelAndView("BookingSuccess");
	}

}
	

		
		

	
	
	
