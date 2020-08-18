package org.alex.platform.service;

import com.github.pagehelper.PageInfo;
import org.alex.platform.exception.BusinessException;
import org.alex.platform.pojo.InterfaceCaseRelyDataDO;
import org.alex.platform.pojo.InterfaceCaseRelyDataDTO;
import org.alex.platform.pojo.InterfaceCaseRelyDataVO;

import java.util.List;


public interface InterfaceCaseRelyDataService {
    void saveIfRelyData(InterfaceCaseRelyDataDO ifRelyDataDO) throws BusinessException;

    void modifyIfRelyData(InterfaceCaseRelyDataDO ifRelyDataDO) throws BusinessException;

    PageInfo<InterfaceCaseRelyDataVO> findIfRelyDataList(InterfaceCaseRelyDataDTO ifRelyDataDTO, Integer pageNum, Integer pageSize);

    InterfaceCaseRelyDataVO findIfRelyData(Integer relyId);

    void removeIfRelyData(Integer relyId);
}
