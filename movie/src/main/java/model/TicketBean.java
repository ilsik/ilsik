package model;

public class TicketBean {
	private String ticket_memberid;
	private String ticket_buy_type;
	private String ticket_date;
	private String ticket_cinema_title;
	private String ticket_cinema_time;
	private int ticket_theater;
	private char ticket_seat1;
	private int ticket_seat2;
	
	public TicketBean() {}

	public String getTicket_memberid() {
		return ticket_memberid;
	}

	public void setTicket_memberid(String ticket_memberid) {
		this.ticket_memberid = ticket_memberid;
	}

	public String getTicket_buy_type() {
		return ticket_buy_type;
	}

	public void setTicket_buy_type(String ticket_buy_type) {
		this.ticket_buy_type = ticket_buy_type;
	}

	public String getTicket_date() {
		return ticket_date;
	}

	public void setTicket_date(String ticket_date) {
		this.ticket_date = ticket_date;
	}

	public String getTicket_cinema_title() {
		return ticket_cinema_title;
	}

	public void setTicket_cinema_title(String ticket_cinema_title) {
		this.ticket_cinema_title = ticket_cinema_title;
	}

	public String getTicket_cinema_time() {
		return ticket_cinema_time;
	}

	public void setTicket_cinema_time(String ticket_cinema_time) {
		this.ticket_cinema_time = ticket_cinema_time;
	}

	public int getTicket_theater() {
		return ticket_theater;
	}

	public void setTicket_theater(int ticket_theater) {
		this.ticket_theater = ticket_theater;
	}

	public char getTicket_seat1() {
		return ticket_seat1;
	}

	public void setTicket_seat1(char ticket_seat1) {
		this.ticket_seat1 = ticket_seat1;
	}

	public int getTicket_seat2() {
		return ticket_seat2;
	}

	public void setTicket_seat2(int ticket_seat2) {
		this.ticket_seat2 = ticket_seat2;
	}
	
	
}
