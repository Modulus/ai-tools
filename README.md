docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

# Compose setup found in official open webui repo
https://github.com/open-webui/open-webui


To use RAG, the following steps worked for me (I have LLama3 + Open WebUI v0.3.5 Docker container):

    I copied a file.txt from my computer to the Open WebUI container:
    $ docker cp ~/Downloads/file.txt open-webui:/app/backend/data/docs/

    In the Open WebUI Admin Panel > Settings > Documents > Scan for documents from DOCS_DIR (/data/docs), I clicked Scan. It confirmed with Scan complete!

    I refreshed the New Chat page with CTRL+R.

    In the prompt, I typed the hashtag # key, it listed the scanned files, I selected file.txt, I asked a question about it, for example "what does the context contain?" , and it answered correctly about the contents of the file.


# 

