Voici la base de données relationnelle complète en SQL, modélisée selon vos spécifications et structurée pour illustrer le contraste entre la musique pop (très populaire, très visible, axée sur les réseaux) et la musique classique (moins populaire en volume d'audience, axée sur l'introspection et la profondeur).

La table principale `newspaper_article` fait le lien (1 à plusieurs via tables de jointure) avec toutes les autres tables, et le premier article inclut l'exemple précisé : *"Agile developer from dusk till dawn wants to make friends on rails and social media"*.

```sql
-- Base de données : Pop_Vs_Classical_Social_Reflections

-- 1. Enjoy Holiday
CREATE TABLE enjoy_holiday (
    holiday_id INT PRIMARY KEY AUTO_INCREMENT,
    group_photo VARCHAR(255),
    photo_enjoy_activity_or_peace_and_quiet_in_milieu_naturel TEXT
);

-- 2. Contact
CREATE TABLE contact (
    contact_id INT PRIMARY KEY AUTO_INCREMENT,
    who_is_this VARCHAR(100),
    nom VARCHAR(100),
    phone VARCHAR(50),
    pic VARCHAR(255),
    lurker_quiet_scrolling BOOLEAN DEFAULT TRUE
);

-- 3. Glamour Highlight Reels Best Life
CREATE TABLE glamour_highlight_reels_best_life (
    glamour_id INT PRIMARY KEY AUTO_INCREMENT,
    tuesday_afternoon_realitypic VARCHAR(255),
    posting_social_media TEXT,
    likes INT DEFAULT 0,
    reactions INT DEFAULT 0,
    how_to_protect_your_confidence_and_energy TEXT
);

-- 4. Social Media Scrolling
CREATE TABLE social_media_scrolling (
    scrolling_id INT PRIMARY KEY AUTO_INCREMENT,
    lines_comments TEXT,
    enjoy_staying_connected BOOLEAN,
    boundaries_valued_alone_with_a_tree TEXT,
    musical_text VARCHAR(100),
    number_of_times_staged INT DEFAULT 0
);

-- 5. Social Media Posts Account
CREATE TABLE social_media_posts_account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    frequency VARCHAR(50),
    tone_in_captions VARCHAR(100),
    built_story TEXT
);

-- 6. Social Media Consciousness
CREATE TABLE social_media_consciousness (
    consciousness_id INT PRIMARY KEY AUTO_INCREMENT,
    how_will_this_look TEXT,
    how_does_this_feel TEXT
);

-- 7. Emotional Intelligence
CREATE TABLE emotional_intelligence (
    ei_id INT PRIMARY KEY AUTO_INCREMENT,
    managing_your_public_image TEXT,
    musical_text_score VARCHAR(100),
    time_for_self_reflection_in_the_lake TEXT,
    ask_hard_question TEXT,
    build_identity TEXT,
    outside_approval INT DEFAULT 0,
    number_of_times_staged INT DEFAULT 0
);

-- 8. Posting Not Posting
CREATE TABLE posting_not_posting (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    description TEXT,
    photo VARCHAR(255),
    photographing_it BOOLEAN,
    writing_the_caption TEXT,
    achievement_only_yours BOOLEAN,
    posting_or_not_posting VARCHAR(20)
);

-- 9. Musical Performance
CREATE TABLE musical_performance (
    performance_id INT PRIMARY KEY AUTO_INCREMENT,
    number_of_times_staged INT,
    number_of_audiences INT, -- web = 1, real place = 1
    user_id INT,
    composer VARCHAR(100),
    title VARCHAR(255),
    vid VARCHAR(255)
);

-- 10. Opt Out
CREATE TABLE opt_out (
    opt_out_id INT PRIMARY KEY AUTO_INCREMENT,
    terms_in_connecting TEXT,
    show_or_performance VARCHAR(100),
    real_time BOOLEAN
);

-- 11. Reflection On Depth Or Presence
CREATE TABLE reflection_on_depth_or_presence (
    reflection_id INT PRIMARY KEY AUTO_INCREMENT,
    posts INT,
    followers INT,
    performing BOOLEAN,
    did_you_post_more BOOLEAN,
    did_you_live_more BOOLEAN
);

-- 12. Newspaper Article (Table principale)
CREATE TABLE newspaper_article (
    newspaper_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    content TEXT,
    deep_friendship TEXT,
    followers INT,
    number_of_times_staged INT
);

-- -----------------------------------------------------------------------------
-- TABLES D'ASSOCIATION (Un article a 1 ou plusieurs enregistrements de toutes les autres tables)
-- -----------------------------------------------------------------------------

CREATE TABLE newspaper_enjoy_holiday (
    newspaper_id INT,
    holiday_id INT,
    PRIMARY KEY (newspaper_id, holiday_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (holiday_id) REFERENCES enjoy_holiday(holiday_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_contact (
    newspaper_id INT,
    contact_id INT,
    PRIMARY KEY (newspaper_id, contact_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_glamour (
    newspaper_id INT,
    glamour_id INT,
    PRIMARY KEY (newspaper_id, glamour_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (glamour_id) REFERENCES glamour_highlight_reels_best_life(glamour_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_scrolling (
    newspaper_id INT,
    scrolling_id INT,
    PRIMARY KEY (newspaper_id, scrolling_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (scrolling_id) REFERENCES social_media_scrolling(scrolling_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_account (
    newspaper_id INT,
    account_id INT,
    PRIMARY KEY (newspaper_id, account_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES social_media_posts_account(account_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_consciousness (
    newspaper_id INT,
    consciousness_id INT,
    PRIMARY KEY (newspaper_id, consciousness_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (consciousness_id) REFERENCES social_media_consciousness(consciousness_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_emotional_intelligence (
    newspaper_id INT,
    ei_id INT,
    PRIMARY KEY (newspaper_id, ei_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (ei_id) REFERENCES emotional_intelligence(ei_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_posting_not_posting (
    newspaper_id INT,
    post_id INT,
    PRIMARY KEY (newspaper_id, post_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posting_not_posting(post_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_musical_performance (
    newspaper_id INT,
    performance_id INT,
    PRIMARY KEY (newspaper_id, performance_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (performance_id) REFERENCES musical_performance(performance_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_opt_out (
    newspaper_id INT,
    opt_out_id INT,
    PRIMARY KEY (newspaper_id, opt_out_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (opt_out_id) REFERENCES opt_out(opt_out_id) ON DELETE CASCADE
);

CREATE TABLE newspaper_reflection (
    newspaper_id INT,
    reflection_id INT,
    PRIMARY KEY (newspaper_id, reflection_id),
    FOREIGN KEY (newspaper_id) REFERENCES newspaper_article(newspaper_id) ON DELETE CASCADE,
    FOREIGN KEY (reflection_id) REFERENCES reflection_on_depth_or_presence(reflection_id) ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- EXEMPLES D'INSERTION DE DONNÉES
-- -----------------------------------------------------------------------------

-- 1. Insertion du premier article de journal
INSERT INTO newspaper_article (newspaper_id, title, content, deep_friendship, followers, number_of_times_staged)
VALUES (
    1,
    'Agile developer from dusk till dawn wants to make friends on rails and social media',
    'Different possibilities: you live more and you post more and self reflected life long during thoughts come later. Decide when you glamour highlight reel at the same time as Tuesday afternoon routine, and opt out and decide on terms you are connecting again.',
    'Authentic connection over algorithms',
    1500,
    5
);

-- 2. Performances musicales : Pop (très populaire) vs Classique (moins populaire, plus intime)
INSERT INTO musical_performance (performance_id, number_of_times_staged, number_of_audiences, user_id, composer, title, vid)
VALUES 
(1, 1, 5000000, 101, 'Top Pop Artist', 'Viral Summer Pop Hit', 'pop_viral.mp4'), -- Pop: 5M d'audiences
(2, 8, 120, 102, 'J.S. Bach', 'Cello Suite No. 1 in G Major', 'bach_cello.mp4');     -- Classique: 120 audiences

-- 3. Intelligence émotionnelle
INSERT INTO emotional_intelligence (ei_id, managing_your_public_image, musical_text_score, time_for_self_reflection_in_the_lake, ask_hard_question, build_identity, outside_approval, number_of_times_staged)
VALUES 
(1, 'Filtering reality for popular approval', 'Pop Score: 98/100 Popularity', '5 minutes', 'Is this post getting likes?', 'Public Persona', 9500, 10),
(2, 'Embracing quiet introspection', 'Classical Score: 15/100 Popularity', '2 hours', 'Did I live this moment deeply?', 'Authentic Self', 45, 1);

-- 4. Liaison du premier article aux performances musicales et à l'intelligence émotionnelle
INSERT INTO newspaper_musical_performance (newspaper_id, performance_id) VALUES (1, 1), (1, 2);
INSERT INTO newspaper_emotional_intelligence (newspaper_id, ei_id) VALUES (1, 1), (1, 2);

```
