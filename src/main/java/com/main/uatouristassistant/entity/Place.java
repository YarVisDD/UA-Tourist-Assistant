package com.main.uatouristassistant.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Place {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idPlace;
    private String placeName;
    private String placeDescription;
    @Enumerated(EnumType.STRING)
    private PlaceType placeType;
    //TODO: images
    private String imageName;
    //TODO поміняти на юзера
    private String userName;
    //TODO переробити адрес
    private String address;
}