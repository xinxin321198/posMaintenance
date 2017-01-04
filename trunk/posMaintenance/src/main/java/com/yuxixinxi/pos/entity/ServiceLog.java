package com.yuxixinxi.pos.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * pos机维护记录
 *
 */
@TableName(value = "pos_service_log")
public class ServiceLog implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 主键 */
	@TableId(type = IdType.UUID)
	private String id;

	/** pos机id */
	@TableField(value = "machine_id")
	private String machineId;

	/** 维护时间 */
	@TableField(value = "service_date")
	private Date serviceDate;

	/** 是否正常,0正常，1故障 */
	@TableField(value = "is_normal")
	private Integer isNormal;

	/** 维护情况 */
	private String msg;

	/** 维护工作人员id */
	@TableField(value = "user_id")
	private Long userId;

	/** 用户反馈 */
	@TableField(value = "feed_back")
	private String feedBack;

	/** 删除标志 */
	@TableField(value = "del_flag")
	private String delFlag;

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMachineId() {
		return this.machineId;
	}

	public void setMachineId(String machineId) {
		this.machineId = machineId;
	}

	public Date getServiceDate() {
		return this.serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}

	public Integer getIsNormal() {
		return this.isNormal;
	}

	public void setIsNormal(Integer isNormal) {
		this.isNormal = isNormal;
	}

	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getFeedBack() {
		return this.feedBack;
	}

	public void setFeedBack(String feedBack) {
		this.feedBack = feedBack;
	}

	public String getDelFlag() {
		return this.delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

}
