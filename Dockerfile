# Use specific digest to ensure exact version (FRESH BUILD - Just pushed!)
FROM mrwasi/wasimdv7@sha256:4c0e06bfe4c36201d778420b85f063e3afe88a3594e7278461a2b6d116880de8

# Image metadata - UPDATED VERSION
ENV IMAGE_VERSION=7.0.1
ENV BUILD_DATE=2024-02-10
ENV FEATURES="kickall,autojoin,joinrequests,devreact"
ENV LAST_UPDATE="Just now - Fresh build"

# Heroku requires binding to $PORT
ENV PORT=3000

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD node -e "console.log('healthy')" || exit 1

# Start the bot
CMD ["node", "index.js"]
