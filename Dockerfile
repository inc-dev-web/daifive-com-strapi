FROM node:18

WORKDIR /app
COPY package.json yarn.lock .yarnrc.yml ./
RUN yarn install --network-timeout 100000
COPY . .
ENV STRAPI_ADMIN_BACKEND_URL=https://daifive-admin.fly.dev
ENV HOST=daifive-admin.fly.dev
ENV NODE_ENV=production
RUN yarn build
RUN mkdir -p public/uploads

CMD ["yarn", "run", "start"]
