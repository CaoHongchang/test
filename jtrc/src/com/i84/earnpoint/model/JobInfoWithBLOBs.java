package com.i84.earnpoint.model;

public class JobInfoWithBLOBs extends JobInfo {
    private String requireContent;

    private String dutyContent;

    public String getRequireContent() {
        return requireContent;
    }

    public void setRequireContent(String requireContent) {
        this.requireContent = requireContent == null ? null : requireContent.trim();
    }

    public String getDutyContent() {
        return dutyContent;
    }

    public void setDutyContent(String dutyContent) {
        this.dutyContent = dutyContent == null ? null : dutyContent.trim();
    }
}