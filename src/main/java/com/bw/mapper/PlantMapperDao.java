package com.bw.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bw.bean.Plant;
import com.bw.bean.Type;

public interface PlantMapperDao {

	List<Map<String, Object>> list(HashMap<String, Object> map);

	List<Type> selectType();

	void add(Plant plant);

	void delete(int pid);

	Plant toupdate(int pid);

	void update(Plant plant);

	void deleteAll(int[] pid);

}
