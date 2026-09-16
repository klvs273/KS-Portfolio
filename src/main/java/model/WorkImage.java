package model;

public class WorkImage {

    private int id;

    private int workId;

    private String imagePath;

    private String caption;

    private int displayOrder;


    public WorkImage(
            int id,
            int workId,
            String imagePath,
            String caption,
            int displayOrder) {

        this.id = id;
        this.workId = workId;
        this.imagePath = imagePath;
        this.caption = caption;
        this.displayOrder = displayOrder;
    }


    public int getId() {
        return id;
    }


    public int getWorkId() {
        return workId;
    }


    public String getImagePath() {
        return imagePath;
    }


    public String getCaption() {
        return caption;
    }


    public int getDisplayOrder() {
        return displayOrder;
    }
}