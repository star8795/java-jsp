package util;

public class SearchPageMaker extends PageMaker {

	public SearchCriteria getSearchCriteria() {
		if (this.cri instanceof SearchCriteria) {
			return (SearchCriteria) cri;
		}
		return null;
	}

	@Override
	public String makeQuery(int page) {
		String queryString = super.makeQuery(page);
		// ?page=1&perPageNum=20
		if (getSearchCriteria() != null) {
			queryString += "&searchName=" + getSearchCriteria().getSearchName();
			queryString += "&searchValue=" + getSearchCriteria().getSearchValue();
		}
		return queryString;
	}

}