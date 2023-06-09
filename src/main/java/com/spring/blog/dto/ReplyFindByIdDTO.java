package com.spring.blog.dto;

import com.spring.blog.entity.Reply;
import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString @Builder
@AllArgsConstructor @NoArgsConstructor
public class ReplyFindByIdDTO {

    private Long replyId;
    private String replyWriter;
    private String replyContent;
    private LocalDateTime publishedAt;
    private LocalDateTime updatedAt;

    // DTO 는 entity 객체를 이용해서 생성될 수 있어야 한다.
    // 반대는 성립하지 않는다. (Entity 는 DTO의 내부 구조를 알 필요가 없다.)
    public ReplyFindByIdDTO(Reply reply) {
        this.replyId = reply.getReplyId();
        this.replyWriter = reply.getReplyWriter();
        this.replyContent = reply.getReplyContent();
        this.publishedAt = reply.getPublishedAt();
        this.updatedAt = reply.getUpdatedAt();
    }
}