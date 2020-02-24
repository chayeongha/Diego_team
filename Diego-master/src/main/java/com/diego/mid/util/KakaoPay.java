package com.diego.mid.util;

import java.net.URI;

import javax.inject.Inject;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.diego.mid.model.member.Orders;

@Service
public class KakaoPay {
private static final String HOST = "https://kapi.kakao.com";
    
	@Inject
    private KakaoPayReadyVO kakaoPayReadyVO;
    
    public String kakaoPayReady(Orders orders) throws Exception {
    	
    	String id = orders.getId();
    	String orderNum = orders.getOrder_num().toString();
    	String proInfo = orders.getPro_info();
    	String count = orders.getPro_count().toString();
    	String sum = orders.getOrder_sum().toString();
    	RestTemplate restTemplate = new RestTemplate();
    	 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "2bb5c929b9d34448e820d72fd0e6be71");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", orderNum);
        params.add("partner_user_id", id);
        params.add("item_name", proInfo);
        params.add("quantity", count);
        params.add("total_amount", sum);
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost/mid/member/memberManage/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost/mid/member/memberManage/kakaoPayCancel");
        params.add("fail_url", "http://localhost/mid/member/memberManage/kakaoPayFail");
        
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 

            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();

        
    }
}
