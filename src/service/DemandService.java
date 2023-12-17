package service;

import java.util.List;

import model.Demand;

public interface DemandService {

	public boolean addProduct(String userId, String prodId, int demandQty);

	public boolean addProduct(Demand userDemandBean);

	public boolean removeProduct(String userId, String prodId);

	public List<Demand> haveDemanded(String prodId);

}
