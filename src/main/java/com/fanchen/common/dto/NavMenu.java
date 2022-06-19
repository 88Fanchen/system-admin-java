package com.fanchen.common.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Data
public class NavMenu implements Serializable {
    private Long id;
    private String name;
    private String title;
    private String icon;
    private String path;
    private String component;
    private Integer orderNum;
    private List<NavMenu> children = new ArrayList<>();
}
