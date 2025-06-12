# שלב 1: בסיס NodeJS
FROM node:18

# שלב 2: תקיית עבודה
WORKDIR /app

# שלב 3: העתקת קבצי תלות
COPY package*.json ./

# שלב 4: התקנת תלויות
RUN npm install

# שלב 5: העתקת שאר הפרויקט
COPY . .

# שלב 6: בניית גרסת production
RUN npm run build

# שלב 7: פתיחת פורט 3000
EXPOSE 3000

# שלב 8: הפעלת שרת סטטי להצגת התוצאה
CMD ["npx", "serve", "-s", "dist"]
