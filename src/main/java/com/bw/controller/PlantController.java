package com.bw.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.kerberos.KerberosKey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.bean.Plant;
import com.bw.bean.Type;
import com.bw.service.PlantService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller
public class PlantController {

	@Autowired
	private PlantService plantService;

	@RequestMapping("list.do")
	public String list(Model model,@RequestParam(defaultValue="1")int cpage,
			@RequestParam(defaultValue="")String pname) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pname", pname);
		PageHelper.startPage(cpage, 2);
		List<Map<String, Object>> list = plantService.list(map);
		PageInfo<Map<String, Object>> page = new PageInfo<>(list);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("page", page);
		return "list";
	}

	@RequestMapping("add.do")
	public String add() {

		return "add";
	}

	@RequestMapping("toupdate.do")
	public String toupdate(Model model,int pid) {
		Plant plant=plantService.toupdate(pid);

		model.addAttribute("plant", plant);
		return "update";
	}

	@RequestMapping("selectType.do")
	@ResponseBody
	public Object selectType() {
		List<Type> type = plantService.selectType();
		return type;
	}

	@RequestMapping("addPlant.do")
	public String addPlant(Plant plant) {
		System.out.println(plant);
		plantService.add(plant);
		return "redirect:list.do";
	}

	@RequestMapping("delete.do")
	public String delete(int pid) {
		plantService.delete(pid);
		return "redirect:list.do";
	}

	@RequestMapping("update.do")
	public String update(Plant plant) {
		plantService.update(plant);
		return "redirect:list.do";
	}


	@RequestMapping("deleteAll.do")
	@ResponseBody
	public Object deleteAll(int[] pid) {
		plantService.deleteAll(pid);
		return 1;
	}
}
