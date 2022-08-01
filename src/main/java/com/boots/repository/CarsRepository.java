package com.boots.repository;

import com.boots.entity.Cars;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarsRepository extends JpaRepository<Cars, Long> {
    Cars findByBrand(String brand);
}
