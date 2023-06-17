package org.alex.platform.service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: forcc
 * @Date: 2023/06/03/15:17
 * @Description:
 */
public interface FeiShuService {
    void send(String msg);

    String buildContent (List<Map<String, Object>> list,String executename);
}
