package com.keeping.bankservice.api.controller.account_detail;

import com.keeping.bankservice.api.ApiResponse;
import com.keeping.bankservice.api.controller.account_detail.request.AccountDetailRequest;
import com.keeping.bankservice.api.controller.account_detail.request.AddAccountDetailRequest;
import com.keeping.bankservice.api.service.account_detail.AccountDetailService;
import com.keeping.bankservice.api.service.account_detail.dto.AddAccountDetailDto;
import com.keeping.bankservice.global.exception.InvalidRequestException;
import com.keeping.bankservice.global.exception.NoAuthorizationException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/bank-service/api/{member-key}/account-detail")
public class AccountDetailApiController {

    private final AccountDetailService accountDetailService;

    @PostMapping
    public ApiResponse<Void> addAccountDetail(@PathVariable("member-key") String memberKey, @RequestBody AddAccountDetailRequest request) {
        log.debug("AddAccountDetailRequest={}", request);

        List<AccountDetailRequest> addAccountDetailRequest = request.getAccountDetailList();
        List<AddAccountDetailDto> dtoList = AddAccountDetailDto.toDtoList(addAccountDetailRequest);

        try {
            accountDetailService.addAccountDetail(memberKey, dtoList);
        } catch (NoAuthorizationException e) {
            return ApiResponse.of(1, e.getHttpStatus(), e.getResultMessage(), null);
        } catch (InvalidRequestException e) {
            return ApiResponse.of(1, e.getHttpStatus(), e.getResultMessage(), null);
        }

        return ApiResponse.ok(null);
    }

}
