package com.boots.service;


import com.boots.entity.Cars;
import com.boots.repository.CarsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
public class CarsService {
    @PersistenceContext
    private EntityManager em;

    @Autowired
    CarsRepository carsRepository;

    public List<Cars> allCars() {

        return carsRepository.findAll();
    }


    public boolean saveCars(Cars cars) {
        carsRepository.save(cars);
        return true;
    }


    public boolean deleteCars(Long carsId) {
        if (carsRepository.findById(carsId).isPresent()) {
            carsRepository.deleteById(carsId);
            return true;
        }
        return false;
    }

    public List<Cars> carsgtList(Long idMin) {
        return em.createQuery("SELECT u FROM Cars u WHERE u.id > :paramId", Cars.class)
                .setParameter("paramId", idMin).getResultList();
    }

    public List<Cars> listAll(String keyword) {
        if (keyword != null) {
            return carsRepository.search(keyword);
        }
        return carsRepository.findAll();
    }

}
