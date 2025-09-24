function out = findEmbeddedFigure(in)
    % This function relies on internal, undocumented architecture of the
    % MATLAB Editor. Its behavior may change, or stop working completely,
    % in a future release.

    editor_id = in.EDITOR_APPDATA.EDITOR_ID;
    out = findall(groot, "type", "figure", ...
        "Tag", "EmbeddedFigure_Internal", ...
        "editorID", editor_id);

    % Speculative guess: if out has more than element, meaning that there
    % appears to be more than one matching embedded figure, the active one
    % is the first in the list.
    if numel(out) > 1
        out = out(1);
    end
end

% Copyright 2025 Steven L. Eddins