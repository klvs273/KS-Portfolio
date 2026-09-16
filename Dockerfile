# ==================================================
# KS Portfolio
# Java 17 / Tomcat 9
# ==================================================


# --------------------------------------------------
# Build Stage
# Javaソースをコンパイル
# --------------------------------------------------

FROM tomcat:9.0-jdk17-temurin AS build

WORKDIR /build


# Java source
COPY src/main/java ./src/main/java


# Web application
COPY src/main/webapp ./src/main/webapp


# WEB-INF/classes を作成
RUN mkdir -p src/main/webapp/WEB-INF/classes


# Java compile
RUN find src/main/java -name "*.java" > sources.txt \
    && javac \
       -encoding UTF-8 \
       -cp "/usr/local/tomcat/lib/*:src/main/webapp/WEB-INF/lib/*" \
       -d src/main/webapp/WEB-INF/classes \
       @sources.txt



# --------------------------------------------------
# Runtime Stage
# --------------------------------------------------

FROM tomcat:9.0-jdk17-temurin


# Tomcat標準Webアプリを削除
RUN rm -rf /usr/local/tomcat/webapps/*


# PortfolioをROOTアプリとして配置
COPY --from=build \
     /build/src/main/webapp/ \
     /usr/local/tomcat/webapps/ROOT/


# ローカル時のデフォルトポート
ENV PORT=8080

EXPOSE 8080


# RailwayのPORT環境変数をTomcatへ反映して起動
CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT:-8080}\\\"/\" /usr/local/tomcat/conf/server.xml && exec catalina.sh run"]