-- ==================================================
-- KS Portfolio
-- Sample Data
-- ==================================================

USE portfolio_db;


-- ==================================================
-- works
-- ==================================================

INSERT INTO works
(
    id,
    title,
    technologies,
    description,
    display_order,
    image_url,
    github_url,
    demo_url,
    features,
    development_point,
    challenge,
    development_period
)
VALUES
(
    1,
    'Java Task Management System',
    'Java / Servlet / JSP / JDBC / MySQL / Tomcat',
    'Java Servlet・JSP・JDBC・MySQLを利用して制作したタスク管理Webアプリケーションです。',
    1,
    'images/works/task-manager.png',
    NULL,
    NULL,
    'ログイン認証、タスクCRUD、検索、並べ替え、ページング、カテゴリ管理、お気に入り、タスクコピー、ダッシュボード',
    'Servlet・JSP・JDBC・MySQLを組み合わせ、画面表示からデータベース処理まで一連のWebアプリケーションとして構築しました。',
    'JDBC接続、認証処理、検索条件とページングの組み合わせ、お気に入り機能の実装などで発生した問題を切り分けながら修正しました。',
    '職業訓練でのJava Web開発実習'
),
(
    3,
    'VBA Invoice Management System',
    'Excel / VBA / UserForm',
    'Excel VBAとUserFormを利用して、請求書の作成・検索・編集・削除・PDF出力までを一元管理できる請求書管理システムを制作しました。',
    2,
    'images/works/vba-invoice-form.png',
    NULL,
    NULL,
    '新規請求書作成、請求書検索、期間検索、取引先検索、請求書編集、請求書削除、請求書生成、PDF出力、取引先マスタ管理、エラーログ確認、検索件数集計、合計金額集計',
    'Excelシートを直接操作するだけではなく、UserFormを利用してメニュー・入力・検索・管理画面を構築し、請求書業務を一連の操作で完結できるようにしました。',
    '請求書データ、取引先情報、明細データを扱いながら、検索条件による絞り込み、金額計算、請求書生成、PDF出力など複数の処理を連携させる点に取り組みました。',
    '職業訓練でのExcel VBA開発実習'
);


-- ==================================================
-- work_images
-- ==================================================

INSERT INTO work_images
(
    work_id,
    image_path,
    caption,
    display_order
)
VALUES
(
    1,
    'images/works/task-manager.png',
    'ダッシュボード',
    1
),
(
    1,
    'images/works/task-list.png',
    'タスク検索・一覧',
    2
),
(
    1,
    'images/works/task-new.png',
    'タスク新規作成',
    3
),
(
    1,
    'images/works/task-login.png',
    'ログイン',
    4
),

(
    3,
    'images/works/vba-invoice-form.png',
    '請求書入力フォーム',
    1
),
(
    3,
    'images/works/vba-invoice-menu-create.png',
    '請求書管理システム メインメニュー',
    2
),
(
    3,
    'images/works/vba-invoice-search.png',
    '請求書検索・管理',
    3
),
(
    3,
    'images/works/vba-invoice-sheet.png',
    '生成された請求書',
    4
),
(
    3,
    'images/works/vba-invoice-pdf-confirm.png',
    '請求書PDF出力',
    5
),
(
    3,
    'images/works/vba-invoice-statistics.png',
    '検索件数・合計金額集計',
    6
);