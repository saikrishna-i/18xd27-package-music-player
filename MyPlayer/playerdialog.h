#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QMediaPlayer>
#include <QDebug>
#include "musicfile.h"
#include "musicqueue.h"
#include <QListWidgetItem>
QT_BEGIN_NAMESPACE
namespace Ui { class PlayerDialog; }
QT_END_NAMESPACE

class PlayerDialog : public QDialog
{
    Q_OBJECT

public:
    PlayerDialog(QWidget *parent = nullptr);
    ~PlayerDialog();
    void load_music(musicFile  mFile , bool firstPlay);
    void load_playingQueue(musicQueueSpecial * mQueue);

private slots:
    void on_sliderProgress_sliderMoved(int position);

    void on_startButton_clicked();

    void on_positionChanged(qint64 position);

    void on_durationChanged(qint64 position);

    void on_stopButton_clicked();

    void on_previousButton_clicked();

    void on_nextButton_clicked();

    void on_mediaStatusChanged(QMediaPlayer::MediaStatus status);

    void on_clearQueueButton_clicked();

    void on_curSongItemDoubleClicked(QListWidgetItem * item);

    void on_prevSongItemDoubleClicked(QListWidgetItem * item);


    void displayCurQueue();

private:
    Ui::PlayerDialog *ui;
    QMediaPlayer * player;
    musicQueueSpecial * curQueue;
    musicQueueSpecial previous;
    musicFile playingNow;
};

QString msToTime(qint64 msTime);
#endif // DIALOG_H
