package com.util;

import java.io.Serializable;
import java.util.List;

/**
 * 分页助手
 * @author DELL
 *
 * @param <T>
 */
public class PageAssistant<T> implements Serializable {

	/** 总记录数 */
	private int count;
	/** 总页数 */
	private int total;
	/** 页面大小 */
	private int size = 8;
	/** 当前页 */
	private int curr = 1;
	/** 起始记录序号 */
	private int start;
	/** 当前页的数据 */
	private List<T> items;

	@Override
	public String toString() {
		return "PageAssistant [count=" + count + ", total=" + total + ", size=" + size
				+ ", curr=" + curr + ", start=" + start + "]";
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		setTotal();
	}

	public int getTotal() {
		return total;
	}

	private void setTotal() {

		this.total = count / size;

		if(count % size != 0)
			total++;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
		setTotal();
		setStart();
	}

	public int getCurr() {
		return curr;
	}

	public void setCurr(int curr) {
		this.curr = curr;
		setStart();
	}

	public int getStart() {
		return start;
	}

	private void setStart() {
		this.start = (curr - 1) * size;
	}

	public List<T> getItems() {
		return items;
	}

	public void setItems(List<T> items) {
		this.items = items;
	}

}











