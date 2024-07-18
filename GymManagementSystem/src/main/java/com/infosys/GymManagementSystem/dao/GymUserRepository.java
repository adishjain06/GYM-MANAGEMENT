package com.infosys.GymManagementSystem.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.GymManagementSystem.bean.GymUser;

public interface GymUserRepository extends JpaRepository<GymUser, String> {
	Optional<GymUser> findByUsername(String username);

	@Query("SELECT username from GymUser WHERE type='Customer'")
	List<String> findAllCustomerUsers();
}

