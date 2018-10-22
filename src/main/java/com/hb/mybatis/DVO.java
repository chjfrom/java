package com.hb.mybatis;

public class DVO {
	private String r_num,data_idx,d_write,d_department,d_phon,d_title,d_content,d_filename,t_day,t_count;
	
	public String getD_filename() {
		return d_filename;
	}
	
	public String getR_num() {
		return r_num;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}

	public String getT_day() {
		return t_day;
	}

	public String getT_count() {
		return t_count;
	}

	public void setT_count(String t_count) {
		this.t_count = t_count;
	}

	public void setT_day(String t_day) {
		this.t_day = t_day;
	}

	public void setD_filename(String d_filename) {
		this.d_filename = d_filename;
	}

	public String getData_idx() {
		return data_idx;
	}

	public void setData_idx(String data_idx) {
		this.data_idx = data_idx;
	}

	public String getD_write() {
		return d_write;
	}

	public void setD_write(String d_write) {
		this.d_write = d_write;
	}
	
	public String getD_department() {
		return d_department;
	}

	public void setD_department(String d_department) {
		this.d_department = d_department;
	}

	public String getD_phon() {
		return d_phon;
	}

	public void setD_phon(String d_phon) {
		this.d_phon = d_phon;
	}

	public String getD_title() {
		return d_title;
	}

	public void setD_title(String d_title) {
		this.d_title = d_title;
	}

	public String getD_content() {
		return d_content;
	}

	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
}
