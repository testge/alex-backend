package org.alex.platform.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.alex.platform.exception.BusinessException;
import org.alex.platform.mapper.InterfaceCaseRelyDataMapper;
import org.alex.platform.pojo.InterfaceCaseRelyDataDO;
import org.alex.platform.pojo.InterfaceCaseRelyDataDTO;
import org.alex.platform.pojo.InterfaceCaseRelyDataVO;
import org.alex.platform.service.InterfaceCaseRelyDataService;
import org.alex.platform.service.InterfaceCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InterfaceCaseRelyDataServiceImpl implements InterfaceCaseRelyDataService {
    @Autowired
    InterfaceCaseRelyDataMapper ifRelyDataMapper;
    @Autowired
    InterfaceCaseService ifCaseService;

    @Override
    public void saveIfRelyData(InterfaceCaseRelyDataDO ifRelyDataDO) throws BusinessException {
        // 判断caseid是否存在
        Integer caseId = ifRelyDataDO.getRelyCaseId();
        if (ifCaseService.findInterfaceCaseByCaseId(caseId) == null) {
            throw new BusinessException("relyCaseId不存在");
        }
        ifRelyDataMapper.insertIfRelyData(ifRelyDataDO);
    }

    @Override
    public void modifyIfRelyData(InterfaceCaseRelyDataDO ifRelyDataDO) throws BusinessException {
        // 判断caseid是否存在
        Integer caseId = ifRelyDataDO.getRelyCaseId();
        if (ifCaseService.findInterfaceCaseByCaseId(caseId) == null) {
            throw new BusinessException("relyCaseId不存在");
        }
        ifRelyDataMapper.updateIfRelyData(ifRelyDataDO);
    }

    @Override
    public PageInfo<InterfaceCaseRelyDataVO> findIfRelyDataList(InterfaceCaseRelyDataDTO ifRelyDataDTO,
                                                                Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return new PageInfo(ifRelyDataMapper.selectIfRelyDataList(ifRelyDataDTO));
    }

    @Override
    public InterfaceCaseRelyDataVO findIfRelyData(Integer relyId) {
        return ifRelyDataMapper.selectIfRelyData(relyId);
    }

    @Override
    public void removeIfRelyData(Integer relyId) {
        ifRelyDataMapper.deleteIfRelyData(relyId);
    }
}
