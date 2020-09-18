package org.alex.platform.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.alex.platform.mapper.InterfaceAssertLogMapper;
import org.alex.platform.pojo.InterfaceAssertLogDO;
import org.alex.platform.pojo.InterfaceAssertLogDTO;
import org.alex.platform.pojo.InterfaceAssertLogVO;
import org.alex.platform.service.InterfaceAssertLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InterfaceAssertLogServiceImpl implements InterfaceAssertLogService {
    @Autowired
    InterfaceAssertLogMapper mapper;

    @Override
    public void saveInterfaceAssertLog(InterfaceAssertLogDO interfaceAssertLogDO) {
        mapper.insertInterfaceAssertLog(interfaceAssertLogDO);
    }

    @Override
    public PageInfo<InterfaceAssertLogVO> findInterfaceAssertLogList(InterfaceAssertLogDTO interfaceAssertLogDTO,
                                                                     Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return new PageInfo<>(mapper.selectInterfaceAssertLogList(interfaceAssertLogDTO));
    }
}
