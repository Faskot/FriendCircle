package com.boots.entity;


import lombok.Data;
import org.springframework.data.annotation.CreatedBy;

import javax.persistence.*;

@Entity
@Data
@Table(name = "t_cars")
public class Cars {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String brand;
    private String model;
    private String year;
    private String color;
    private String cost;


}
