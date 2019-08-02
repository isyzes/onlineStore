package com.store.config;

import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

public class TelegramBot extends TelegramLongPollingBot {

    @Override
    public void onUpdateReceived(Update update) {

    }

    @Override
    public String getBotUsername() {
        return "@Isyzes_bot";
    }

    @Override
    public String getBotToken() {
        return "555912788:AAEXVo3-mUVidr_yRp-8nnrqxS4rgvzxiM8";
    }

    public synchronized void sendMessage(String text) {
        SendMessage sendMessage = new SendMessage();
        sendMessage.enableMarkdown(true);
        sendMessage.setChatId("503219172");
        sendMessage.setText(text);

        try {
            execute(sendMessage);
        } catch (TelegramApiException ignored) {

        }
    }
}
