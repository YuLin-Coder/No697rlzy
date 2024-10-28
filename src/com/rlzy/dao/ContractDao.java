package com.rlzy.dao;

import com.rlzy.po.Contract;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 合同表DAO层接口
 */
public interface ContractDao {

	int findAllContractCount(@Param("note") String note, @Param("eno") String eno);

	List<Contract> findAllContract(@Param("note") String note, @Param("eno") String eno,
								   @Param("startIndex")int startIndex, @Param("pageSize")Integer pageSize);

	int findAdminAllContractCount(@Param("note") String note);

	List<Contract> findAdminAllContract(@Param("note") String note,
										@Param("startIndex")int startIndex, @Param("pageSize")Integer pageSize);

	void addContract(Contract contract);

	void deleteContract(@Param("contractId")Integer contractId);

	Contract findContractById(@Param("contractId")Integer contractId);

	void updateContract(Contract contract);
}
