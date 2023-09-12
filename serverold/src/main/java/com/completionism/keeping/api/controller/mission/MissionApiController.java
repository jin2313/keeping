package com.completionism.keeping.api.controller.mission;

import com.completionism.keeping.api.ApiResponse;
import com.completionism.keeping.api.controller.mission.request.AddMissionRequest;
import com.completionism.keeping.api.service.mission.MissionService;
import com.completionism.keeping.api.service.mission.dto.AddMissionDto;
import com.completionism.keeping.global.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/mission")
@Slf4j
public class MissionApiController {
    
    private final MissionService missionService;

    /**
     * 미션 등록
     * @param request 미션 request
     * @return 미션 식별키
     */
    @PostMapping
    public ApiResponse<Long> addMission(
            @Valid @RequestBody AddMissionRequest request
            ) {
        // 사용자 정보 가져오기
        // String memberId = SecurityUtil.getCurrentLoginId(); TODO: member완성되면 해제 
        String memberId = "";
        
        log.debug("addMission :: request={}", request);
        log.info("addMission :: request={}", request);

        AddMissionDto dto = AddMissionDto.toDto(request);

        try {
            Long missionId = missionService.addMission(memberId, dto);
            return ApiResponse.ok(missionId);
        } catch (NotFoundException e) {
            return ApiResponse.of(Integer.parseInt(e.getResultCode()), e.getHttpStatus(), e.getResultMessage(), null);
        }
    }
}