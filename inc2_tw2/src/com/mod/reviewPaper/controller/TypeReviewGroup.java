package com.mod.reviewPaper.controller;

import java.util.ArrayList;

import com.model.A;
import com.model.ReviewPaper;
import com.model.ReviewPaperResult;

/**
 * 針對一家企業的所有審查資料(可能是書審或面審資料), 與平均分數
 */
public class TypeReviewGroup extends A {
	String type = "";
	String avgScore = "887788";
	ArrayList<ReviewPaperResult> reviewResults = new ArrayList<ReviewPaperResult>();

	public TypeReviewGroup() {

	}

	public TypeReviewGroup(String type) {
		this.type = type;
	}

	public String getAvgScore() {
		int total = 0;
		int count = 0;
		for (int i = 0; i < reviewResults.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) reviewResults.get(i);
			String score = r.getScore();
			try {
				int n = Integer.parseInt(score);
				total = total + n;
			} catch (Exception e) {
				// e.printStackTrace();
			}
			count++;
		}

		if (count == 0)
			avgScore = "0";
		else
			avgScore = "" + (total / count);
		return avgScore;
	}

	public boolean isPaperReview() {
		return type.equals(ReviewPaper.TYPE_PAPERREVIEW);
	}

	public boolean isMeetingReview() {
		return type.equals(ReviewPaper.TYPE_MEETINGREVIEW);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setAvgScore(String avgScore) {
		this.avgScore = avgScore;
	}

	public ArrayList<ReviewPaperResult> getReviewResults() {
		return reviewResults;
	}

	public void setReviewResults(ArrayList<ReviewPaperResult> reviewResults) {
		this.reviewResults = reviewResults;
	}

	public int hashCode() {
		return type.hashCode();
	}

	public boolean equals(Object o) {
		if (o == null)
			return false;
		if (!(o instanceof TypeReviewGroup))
			return false;
		TypeReviewGroup other = (TypeReviewGroup) o;
		if (!this.type.equals(other.type))
			return false;
		return true;
	}

}
