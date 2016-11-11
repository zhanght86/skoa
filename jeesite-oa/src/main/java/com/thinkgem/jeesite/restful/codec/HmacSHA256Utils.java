package com.thinkgem.jeesite.restful.codec;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.collections.MapUtils;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.*;

public class HmacSHA256Utils {

    public static String digest(String key, String content) {
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            byte[] secretByte = key.getBytes("utf-8");
            byte[] dataBytes = content.getBytes("utf-8");

            SecretKey secret = new SecretKeySpec(secretByte, "HMACSHA256");
            mac.init(secret);

            byte[] doFinal = mac.doFinal(dataBytes);
            byte[] hexB = new Hex().encode(doFinal);
            return new String(hexB, "utf-8");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String digest(String key, Map<String, ?> map) {
        StringBuilder s = new StringBuilder();
        //1.方案1:对传入的map集合中的值进行遍历拼接
        /*for(Object values : map.values()) {
            if(values instanceof String[]) {
                for(String value : (String[])values) {
                    s.append(value);
                }
            } else if(values instanceof List) {
                for(String value : (List<String>)values) {
                    s.append(value);
                }
            } else {
                s.append(values);
            }
        }*/

        //2.方案2:对传入的map集合,先按key升序遍历,当值为字符串数组或者list集合时,再按值升序遍历拼接字符串
        //形如(appId:873c4db8-9a83-4cbe-b9bd-86f8bfa24c91content:内容是什么nonce:1111param1:1param12param11param2:param2projectName:项目标题)
        if(MapUtils.isEmpty(map))
            return null;

        Map<String, Object> sortMap = new TreeMap<>(new Comparator<String>() {
            public int compare(String str1, String str2) {
                //对map的key进行升序排序
                return str1.compareTo(str2);
            }
        });
        sortMap.putAll(map);

        for (Map.Entry<String, ?> entry : sortMap.entrySet()) {
            s.append(entry.getKey()).append(":");
            Object value=entry.getValue();
            if(value instanceof String[]){
                String[] array=(String[])value;
                Arrays.sort(array);
                for(String v : array) {
                    s.append(v);
                }
            }else if(value instanceof List) {
                List<String> list=(List<String>)value;
                Collections.sort(list);
                for(String v : list) {
                    s.append(v);
                }
            } else {
                s.append(value);
            }

        }
        //System.out.println(s.toString());
        return digest(key, s.toString());
    }

}

