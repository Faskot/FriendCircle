package com.boots.repository;

import com.boots.entity.Cars;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CarsRepository extends JpaRepository<Cars, Long> {
    Cars findByBrand(String brand);

    @Query("SELECT p FROM Cars p WHERE CONCAT(p.brand, ' ', p.model, ' ', p.year, ' ', p.color, ' ', p.cost) LIKE %?1%")
    public List<Cars> search(String keyword);
}
