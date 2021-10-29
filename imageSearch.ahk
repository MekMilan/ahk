imgSearch(path)
{
    retry:
    ImageSearch, X, Y, 0, 0, A_ScreenHeight, A_ScreenWidth, %path%
    if not ErrorLevel
    {
        msgBox, FOUND !
    }    
    else
    {
        msgBox, 5, [imageSearch], ERROR
        IfMsgBox, retry
        {
            goto retry
        }
    }
}