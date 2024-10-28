package com.rlzy.service;

import com.rlzy.po.Contract;
import com.rlzy.po.PageInfo;

public interface ContractService {
    /**
     * 查找本人所有的 合同
     * @param pageIndex
     * @param pageSize
     * @param note
     * @return
     */
    PageInfo<Contract> findAllContract(Integer pageIndex, Integer pageSize, String note);

    /**
     * 管理元查找所有的合同
     * @param pageIndex
     * @param pageSize
     * @param note
     * @return
     */
    PageInfo<Contract> findAdminAllContract(Integer pageIndex, Integer pageSize, String note);

    /**
     * 增加合同
     * @param contract
     */
    void addContract(Contract contract);

    /**
     * 删除合同
     * @param contractId
     */
    void deleteContract(Integer contractId);

    /**
     * 获取详细信息
     * @param contractId
     * @return
     */
    Contract findContractById(Integer contractId);

    /**
     * 更新信息
     * @param contract
     */
    void updateContract(Contract contract);
}
