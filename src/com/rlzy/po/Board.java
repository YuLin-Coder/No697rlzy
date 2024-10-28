package com.rlzy.po;

import java.io.Serializable;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 21:48
 */
public class Board  implements Serializable {

    private Integer id;

    private String title;

    private String content;

    private String fbsj;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFbsj() {
        return fbsj;
    }

    public void setFbsj(String fbsj) {
        this.fbsj = fbsj;
    }

    public Board(Integer id, String title, String content, String fbsj) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.fbsj = fbsj;
    }

    public Board() {
        super();
    }

    @Override
    public String toString() {
        return "Board{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", fbsj='" + fbsj + '\'' +
                '}';
    }

}
