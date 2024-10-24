package dto;

public class Task {
	private int taskid;  //auto generated(fixed)
	private String tasktitle;  // editable
	private String taskdescription;  // editable
	private String taskpriority;  // editable
	private String taskduedate;  // editable
	private String taskstatus;  // editable
	private int userid;  // fixed
	
	
	//Custom Constructor
	public Task(int taskid, String tasktitle, String taskdescription, String taskpriority, String taskduedate,
			String taskstatus, int userid) {
		super();
		this.taskid = taskid;
		this.tasktitle = tasktitle;
		this.taskdescription = taskdescription;
		this.taskpriority = taskpriority;
		this.taskduedate = taskduedate;
		this.taskstatus = taskstatus;
		this.userid = userid;
	}
	
	
	public Task(String tasktitle, String taskdescription, String taskpriority, String taskduedate, String taskstatus,
			int userid) {
			super(); 
			this.tasktitle = tasktitle;
			this.taskdescription = taskdescription;
			this.taskpriority = taskpriority;
			this.taskduedate = taskduedate;
			this.taskstatus = taskstatus;
			this.userid = userid;}


	//getters
	public int getTaskid() {
		return taskid;
	}
	
	public String getTasktitle() {
		return tasktitle;
	}
	public String getTaskdescription() {
		return taskdescription;
	}
	public String getTaskpriority() {
		return taskpriority;
	}
	public String getTaskduedate() {
		return taskduedate;
	}
	public String getTaskstatus() {
		return taskstatus;
	}
	public int getUserid() {
		return userid;
	}
	
	
	//setters
	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}
	public void setTasktitle(String tasktitle) {
		this.tasktitle = tasktitle;
	}
	public void setTaskdescription(String taskdescription) {
		this.taskdescription = taskdescription;
	}
	public void setTaskpriority(String taskpriority) {
		this.taskpriority = taskpriority;
	}
	public void setTaskduedate(String taskduedate) {
		this.taskduedate = taskduedate;
	}
	public void setTaskstatus(String taskstatus) {
		this.taskstatus = taskstatus;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	 @Override
	//toString methods
	public String toString() 
	{
		return "Task [taskid=" + taskid + ", tasktitle=" + tasktitle + ", taskdescription=" + taskdescription
				+ ", taskpriority=" + taskpriority + ", taskduedate=" + taskduedate + ", taskstatus=" + taskstatus
				+ ", userid=" + userid + "]";
	}
}
