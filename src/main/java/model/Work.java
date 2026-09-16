package model;

public class Work {

    // ==========================================
    // 基本情報
    // ==========================================

    private int id;

    private String title;

    private String technologies;

    private String description;

    private String imageUrl;

    private String githubUrl;

    private String demoUrl;


    // ==========================================
    // 詳細情報
    // ==========================================

    private String features;

    private String developmentPoint;

    private String challenge;

    private String developmentPeriod;


    // ==========================================
    // 既存コンストラクタ
    //
    // 一覧取得などで使用
    // ==========================================

    public Work(
            int id,
            String title,
            String technologies,
            String description,
            String imageUrl,
            String githubUrl,
            String demoUrl) {

        this.id = id;
        this.title = title;
        this.technologies = technologies;
        this.description = description;
        this.imageUrl = imageUrl;
        this.githubUrl = githubUrl;
        this.demoUrl = demoUrl;
    }


    // ==========================================
    // 詳細情報込みコンストラクタ
    //
    // findById() などで使用
    // ==========================================

    public Work(
            int id,
            String title,
            String technologies,
            String description,
            String imageUrl,
            String githubUrl,
            String demoUrl,
            String features,
            String developmentPoint,
            String challenge,
            String developmentPeriod) {

        this.id = id;
        this.title = title;
        this.technologies = technologies;
        this.description = description;
        this.imageUrl = imageUrl;
        this.githubUrl = githubUrl;
        this.demoUrl = demoUrl;

        this.features = features;
        this.developmentPoint = developmentPoint;
        this.challenge = challenge;
        this.developmentPeriod = developmentPeriod;
    }


    // ==========================================
    // GETTER
    // ==========================================

    public int getId() {

        return id;
    }


    public String getTitle() {

        return title;
    }


    public String getTechnologies() {

        return technologies;
    }


    public String getDescription() {

        return description;
    }


    public String getImageUrl() {

        return imageUrl;
    }


    public String getGithubUrl() {

        return githubUrl;
    }


    public String getDemoUrl() {

        return demoUrl;
    }


    public String getFeatures() {

        return features;
    }


    public String getDevelopmentPoint() {

        return developmentPoint;
    }


    public String getChallenge() {

        return challenge;
    }


    public String getDevelopmentPeriod() {

        return developmentPeriod;
    }
}