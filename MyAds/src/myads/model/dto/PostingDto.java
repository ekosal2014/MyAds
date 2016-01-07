
package myads.model.dto;

import java.util.List;

public class PostingDto {
	private int PostingId;
	private int MemId;
	private String Title;
	private String Key;
	private int SubCateId;
	private String Size;
	private int Price;
	private String Quality;
	private String Phone;
	private String Adr;
	private List<Image> Photo;
	private String dsc;
	private String postdate;
	private Image image;
	private MainCategoryDto mainCategory;
	private String discount;
	
	
	public int getPostingId() {
		return PostingId;
	}
	public void setPostingId(int postingId) {
		PostingId = postingId;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getSize() {
		return Size;
	}
	public void setSize(String size) {
		Size = size;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public String getQuality() {
		return Quality;
	}
	public void setQuality(String quality) {
		Quality = quality;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getAdr() {
		return Adr;
	}
	public void setAdr(String adr) {
		Adr = adr;
	}
	
	/*public List<MultipartRequest> getPhoto() {
		return Photo;
	}
	public void setPhoto(List<MultipartRequest> photo) {
		Photo = photo;
	}*/
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getDsc() {
		return dsc;
	}
	public void setDsc(String dsc) {
		this.dsc = dsc;
	}
	public int getMemId() {
		return MemId;
	}
	public void setMemId(int memId) {
		MemId = memId;
	}
	public int getSubCateId() {
		return SubCateId;
	}
	public void setSubCateId(int subCateId) {
		SubCateId = subCateId;
	}
	private int active;


	public List<Image> getPhoto() {
		return Photo;
	}
	public void setPhoto(List<Image> photo) {
		Photo = photo;
	}
	public String getKey() {
		return Key;
	}
	public void setKey(String key) {
		Key = key;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	public MainCategoryDto getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(MainCategoryDto mainCategory) {
		this.mainCategory = mainCategory;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	

}
