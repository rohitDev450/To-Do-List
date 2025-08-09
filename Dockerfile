# Use official nginx image as base
FROM nginx:alpine

# Remove default nginx website content
RUN rm -rf /usr/share/nginx/html/*

# Copy your app's files into nginx's html folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx server (default command)
CMD ["nginx", "-g", "daemon off;"]
