
library(rlang)
library(httr)
library(urltools)
library(rvest)
library(stringr)

# 검색어를 지정합니다. 
searchWord1 <- '연남'
searchWord2 <- '합정'
searchWord3 <- '상수'
searchWord4 <- '홍대'
searchWord5 <- '망원'


res <- GET(url = 'https://www.diningcode.com/list.php/isearch.php',
           query = list(query = searchWord1))

res %>% 
  read_html() %>% 
  html_nodes(css = '#div_list > li') -> items


# items을 출력합니다. 
print(x = items)

# 첫 번째 HTML 요소를 삭제합니다. 
items <- items[-5]
items <- items[-1]

# 식당 이름을 출력합니다. 
items %>% 
  html_node(css = 'a > span.btxt') %>% 
  html_text(trim = TRUE) -> name

# 식당 링크를 출력합니다. 
items %>% 
  html_node(css = 'a') %>% 
  html_attr(name = 'href') -> link

# 주요 메뉴를 출력합니다. 
items %>% 
  html_node(css = 'a > span.stxt') %>% 
  html_text(trim = TRUE) -> menu

# 식당 소개를 출력합니다. 
items %>% 
  html_node(css = 'a > span.ctxt') %>% 
  html_text(trim = TRUE) -> desc

# 식당 상권을 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  html_text(trim = TRUE) -> area

# 식당 주소를 출력하기 위해 불필요한 <i> 태그를 삭제합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  xml_remove()

# 식당 주소를 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5)') %>% 
  html_text(trim = TRUE) -> addr

# 좋아요 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.favor') %>% 
  html_text() %>% 
  as.numeric() -> like

# 리뷰 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.review') %>% 
  html_text() %>% 
  as.numeric() -> revw

# 점수를 출력합니다. 
items %>%
  html_node(css = 'p > span.point') %>% 
  html_text() %>% 
  str_remove(pattern = '점') %>% 
  as.numeric() -> mark

df1 <- data.frame(name, menu, desc, area, addr, like, revw, mark)

#=================
res <- GET(url = 'https://www.diningcode.com/list.php/isearch.php',
           query = list(query = searchWord2))

res %>% 
  read_html() %>% 
  html_nodes(css = '#div_list > li') -> items


# items을 출력합니다. 
print(x = items)

# 첫 번째 HTML 요소를 삭제합니다. 
items <- items[-5]
items <- items[-1]

# 식당 이름을 출력합니다. 
items %>% 
  html_node(css = 'a > span.btxt') %>% 
  html_text(trim = TRUE) -> name

# 식당 링크를 출력합니다. 
items %>% 
  html_node(css = 'a') %>% 
  html_attr(name = 'href') -> link

# 주요 메뉴를 출력합니다. 
items %>% 
  html_node(css = 'a > span.stxt') %>% 
  html_text(trim = TRUE) -> menu

# 식당 소개를 출력합니다. 
items %>% 
  html_node(css = 'a > span.ctxt') %>% 
  html_text(trim = TRUE) -> desc

# 식당 상권을 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  html_text(trim = TRUE) -> area

# 식당 주소를 출력하기 위해 불필요한 <i> 태그를 삭제합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  xml_remove()

# 식당 주소를 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5)') %>% 
  html_text(trim = TRUE) -> addr

# 좋아요 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.favor') %>% 
  html_text() %>% 
  as.numeric() -> like

# 리뷰 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.review') %>% 
  html_text() %>% 
  as.numeric() -> revw

# 점수를 출력합니다. 
items %>%
  html_node(css = 'p > span.point') %>% 
  html_text() %>% 
  str_remove(pattern = '점') %>% 
  as.numeric() -> mark

df2 <- data.frame(name, menu, desc, area, addr, like, revw, mark)

#=================

res <- GET(url = 'https://www.diningcode.com/list.php/isearch.php',
query = list(query = searchWord3))

res %>% 
  read_html() %>% 
  html_nodes(css = '#div_list > li') -> items


# items을 출력합니다. 
print(x = items)

# 첫 번째 HTML 요소를 삭제합니다. 
items <- items[-5]
items <- items[-1]

# 식당 이름을 출력합니다. 
items %>% 
  html_node(css = 'a > span.btxt') %>% 
  html_text(trim = TRUE) -> name

# 식당 링크를 출력합니다. 
items %>% 
  html_node(css = 'a') %>% 
  html_attr(name = 'href') -> link

# 주요 메뉴를 출력합니다. 
items %>% 
  html_node(css = 'a > span.stxt') %>% 
  html_text(trim = TRUE) -> menu

# 식당 소개를 출력합니다. 
items %>% 
  html_node(css = 'a > span.ctxt') %>% 
  html_text(trim = TRUE) -> desc

# 식당 상권을 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  html_text(trim = TRUE) -> area

# 식당 주소를 출력하기 위해 불필요한 <i> 태그를 삭제합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  xml_remove()

# 식당 주소를 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5)') %>% 
  html_text(trim = TRUE) -> addr

# 좋아요 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.favor') %>% 
  html_text() %>% 
  as.numeric() -> like

# 리뷰 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.review') %>% 
  html_text() %>% 
  as.numeric() -> revw

# 점수를 출력합니다. 
items %>%
  html_node(css = 'p > span.point') %>% 
  html_text() %>% 
  str_remove(pattern = '점') %>% 
  as.numeric() -> mark

df3 <- data.frame(name, menu, desc, area, addr, like, revw, mark)

#=================

res <- GET(url = 'https://www.diningcode.com/list.php/isearch.php',
query = list(query = searchWord4))

res %>% 
  read_html() %>% 
  html_nodes(css = '#div_list > li') -> items


# items을 출력합니다. 
print(x = items)

# 첫 번째 HTML 요소를 삭제합니다. 
items <- items[-5]
items <- items[-1]

# 식당 이름을 출력합니다. 
items %>% 
  html_node(css = 'a > span.btxt') %>% 
  html_text(trim = TRUE) -> name

# 식당 링크를 출력합니다. 
items %>% 
  html_node(css = 'a') %>% 
  html_attr(name = 'href') -> link

# 주요 메뉴를 출력합니다. 
items %>% 
  html_node(css = 'a > span.stxt') %>% 
  html_text(trim = TRUE) -> menu

# 식당 소개를 출력합니다. 
items %>% 
  html_node(css = 'a > span.ctxt') %>% 
  html_text(trim = TRUE) -> desc

# 식당 상권을 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  html_text(trim = TRUE) -> area

# 식당 주소를 출력하기 위해 불필요한 <i> 태그를 삭제합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  xml_remove()

# 식당 주소를 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5)') %>% 
  html_text(trim = TRUE) -> addr

# 좋아요 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.favor') %>% 
  html_text() %>% 
  as.numeric() -> like

# 리뷰 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.review') %>% 
  html_text() %>% 
  as.numeric() -> revw

# 점수를 출력합니다. 
items %>%
  html_node(css = 'p > span.point') %>% 
  html_text() %>% 
  str_remove(pattern = '점') %>% 
  as.numeric() -> mark

df4 <- data.frame(name, menu, desc, area, addr, like, revw, mark)

#=================

res <- GET(url = 'https://www.diningcode.com/list.php/isearch.php',
query = list(query = searchWord5))

res %>% 
  read_html() %>% 
  html_nodes(css = '#div_list > li') -> items


# items을 출력합니다. 
print(x = items)

# 첫 번째 HTML 요소를 삭제합니다. 
items <- items[-5]
items <- items[-1]

# 식당 이름을 출력합니다. 
items %>% 
  html_node(css = 'a > span.btxt') %>% 
  html_text(trim = TRUE) -> name

# 식당 링크를 출력합니다. 
items %>% 
  html_node(css = 'a') %>% 
  html_attr(name = 'href') -> link

# 주요 메뉴를 출력합니다. 
items %>% 
  html_node(css = 'a > span.stxt') %>% 
  html_text(trim = TRUE) -> menu

# 식당 소개를 출력합니다. 
items %>% 
  html_node(css = 'a > span.ctxt') %>% 
  html_text(trim = TRUE) -> desc

# 식당 상권을 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  html_text(trim = TRUE) -> area

# 식당 주소를 출력하기 위해 불필요한 <i> 태그를 삭제합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  xml_remove()

# 식당 주소를 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5)') %>% 
  html_text(trim = TRUE) -> addr

# 좋아요 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.favor') %>% 
  html_text() %>% 
  as.numeric() -> like

# 리뷰 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.review') %>% 
  html_text() %>% 
  as.numeric() -> revw

# 점수를 출력합니다. 
items %>%
  html_node(css = 'p > span.point') %>% 
  html_text() %>% 
  str_remove(pattern = '점') %>% 
  as.numeric() -> mark

df1 <- data.frame(name, menu, desc, area, addr, like, revw, mark)

#=================res <- GET(url = 'https://www.diningcode.com/list.php/isearch.php',
query = list(query = searchWord1))

res %>% 
  read_html() %>% 
  html_nodes(css = '#div_list > li') -> items


# items을 출력합니다. 
print(x = items)

# 첫 번째 HTML 요소를 삭제합니다. 
items <- items[-5]
items <- items[-1]

# 식당 이름을 출력합니다. 
items %>% 
  html_node(css = 'a > span.btxt') %>% 
  html_text(trim = TRUE) -> name

# 식당 링크를 출력합니다. 
items %>% 
  html_node(css = 'a') %>% 
  html_attr(name = 'href') -> link

# 주요 메뉴를 출력합니다. 
items %>% 
  html_node(css = 'a > span.stxt') %>% 
  html_text(trim = TRUE) -> menu

# 식당 소개를 출력합니다. 
items %>% 
  html_node(css = 'a > span.ctxt') %>% 
  html_text(trim = TRUE) -> desc

# 식당 상권을 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  html_text(trim = TRUE) -> area

# 식당 주소를 출력하기 위해 불필요한 <i> 태그를 삭제합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5) > i') %>% 
  xml_remove()

# 식당 주소를 출력합니다. 
items %>% 
  html_node(css = 'a > span:nth-child(5)') %>% 
  html_text(trim = TRUE) -> addr

# 좋아요 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.favor') %>% 
  html_text() %>% 
  as.numeric() -> like

# 리뷰 수를 출력합니다. 
items %>% 
  html_node(css = 'p > span.review') %>% 
  html_text() %>% 
  as.numeric() -> revw

# 점수를 출력합니다. 
items %>%
  html_node(css = 'p > span.point') %>% 
  html_text() %>% 
  str_remove(pattern = '점') %>% 
  as.numeric() -> mark

df5 <- data.frame(name, menu, desc, area, addr, like, revw, mark)

#=================
#======================


df <- rbind(df1, df2, df3, df4, df5)



write.xlsx(df, "df.xlsx")


