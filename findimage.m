function im = findimage
    ax = imgca;
    h = findobj(ax,"type","image");
    if isempty(h)
        error("No image object found.");
    end
    im = h(1);
end