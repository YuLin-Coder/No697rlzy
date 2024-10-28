package com.rlzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.rlzy.dao.ContractDao;
import com.rlzy.dao.ContractDao;
import com.rlzy.po.Contract;
import com.rlzy.po.Contract;
import com.rlzy.po.PageInfo;
import com.rlzy.service.ContractService;
import com.rlzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ContractService")
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractDao contractDao;

    @Autowired
    private UserService userService;
    
    /**
     * 查找本人所有的 合同
     * @param pageIndex
     * @param pageSize
     * @param note
     * @return
     */
    @Override
    public PageInfo<Contract> findAllContract(Integer pageIndex, Integer pageSize, String note) {
        int count = contractDao.findAllContractCount(note,userService.getCurrentUser().getEno());
        PageHelper.startPage(pageIndex, pageSize);
        List<Contract> contractList = contractDao.findAllContract(note,userService.getCurrentUser().getEno(),(pageIndex - 1) * pageSize,pageSize);

        PageInfo<Contract> pi = new PageInfo<Contract>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        pi.setTotalCount(count);
        pi.setList(contractList);
        return pi;
    }

    /**
     * 管理元查找所有的合同
     * @param pageIndex
     * @param pageSize
     * @param note
     * @return
     */
    @Override
    public PageInfo<Contract> findAdminAllContract(Integer pageIndex, Integer pageSize, String note) {
        int count = contractDao.findAdminAllContractCount(note);
        PageHelper.startPage(pageIndex, pageSize);
        List<Contract> contractList = contractDao.findAdminAllContract(note,(pageIndex - 1) * pageSize,pageSize);

        PageInfo<Contract> pi = new PageInfo<Contract>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        pi.setTotalCount(count);
        pi.setList(contractList);
        return pi;
    }

    /**
     * 增加合同
     * @param contract
     */
    @Override
    public void addContract(Contract contract) {
        contractDao.addContract(contract);
    }

    /**
     * 删除合同
     * @param contractId
     */
    @Override
    public void deleteContract(Integer contractId) {
        contractDao.deleteContract(contractId);
    }


    /**
     * 获取详细信息
     * @param contractId
     * @return
     */
    @Override
    public Contract findContractById(Integer contractId) {
        Contract contract =  contractDao.findContractById(contractId);
        return contract;
    }

    /**
     * 更新信息
     * @param contract
     */
    @Override
    public void updateContract(Contract contract) {
        contractDao.updateContract(contract);
    }
}
