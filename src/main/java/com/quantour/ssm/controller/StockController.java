package com.quantour.ssm.controller;

import com.quantour.ssm.model.Stock;
import com.quantour.ssm.service.StockService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/**
 * Created by loohaze on 2017/5/11.
 */
@Controller
@RequestMapping("/stock")
public class StockController {

    private Logger log = Logger.getLogger(StockController.class);

    @Resource
    private StockService stockService;

    @RequestMapping("")
    public String showDateByCode(HttpServletRequest request, Model model){
//        List<String> data = stockService.getAllDateByCode("000001");
        Stock stock = stockService.getOneStock("000001","2007-01-01");
        model.addAttribute("stock",stock);
        return "test";
    }

}
