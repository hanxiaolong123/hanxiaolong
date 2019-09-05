package com.bw.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.bean.Plant;
import com.bw.bean.Type;
import com.bw.mapper.PlantMapperDao;
@Service
public class PlantServicelmpl implements PlantService{

	@Autowired
	private PlantMapperDao plantMapperDao;

	@Override
	public List<Map<String, Object>> list(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return plantMapperDao.list(map);
	}

	@Override
	public List<Type> selectType() {
		// TODO Auto-generated method stub
		return plantMapperDao.selectType();
	}

	@Override
	public void add(Plant plant) {
		// TODO Auto-generated method stub
		plantMapperDao.add(plant);
	}

	@Override
	public void delete(int pid) {
		// TODO Auto-generated method stub
		plantMapperDao.delete(pid);
	}

	@Override
	public Plant toupdate(int pid) {
		// TODO Auto-generated method stub
		return plantMapperDao.toupdate(pid);
	}

	@Override
	public void update(Plant plant) {
		// TODO Auto-generated method stub
		plantMapperDao.update(plant);
	}

	@Override
	public void deleteAll(int[] pid) {
		// TODO Auto-generated method stub
		plantMapperDao.deleteAll(pid);
	}
	
	
}
