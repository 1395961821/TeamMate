FROM nginx

# 删除 Nginx 的默认配置文件
RUN rm /etc/nginx/conf.d/default.conf

# 将自定义的配置文件复制到容器中
COPY nginx.conf /etc/nginx/conf.d/