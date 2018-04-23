package com.railway.model;

public class Train {
	private String Tid;
	private String Tname;
	private String Tstartstation;
	private String Tterminus;
	private String Ttype;

	public String getTid() {
		return Tid;
	}

	public void setTid(String tid) {
		Tid = tid;
	}

	public String getTname() {
		return Tname;
	}

	public void setTname(String tname) {
		Tname = tname;
	}

	public String getTstartstation() {
		return Tstartstation;
	}

	public void setTstartstation(String tstartstation) {
		Tstartstation = tstartstation;
	}

	public String getTterminus() {
		return Tterminus;
	}

	public void setTterminus(String tterminus) {
		Tterminus = tterminus;
	}

	public String getTtype() {
		return Ttype;
	}

	public void setTtype(String ttype) {
		Ttype = ttype;
	}
}
