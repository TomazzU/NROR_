
%Funkcijska datoteka za generiranje koordinat naključnih točk in
%opredelitev glede na lego na točke znotraj kvadrata in tiste, ki so
%znotraj kroga
function [znotraj_kroga, znotraj_kvadrata] = mcc_pi(st_tock)
    % Funkcija mcc_pi izračuna koordinate točk znotraj kroga in kvadrata.
    % Argumenti:
    %   - st_tock: število naključnih točk
    % Izhodni parametri:
    %   - znotraj_kroga: število točk znotraj kroga
    %   - znotraj_kvadrata: število točk znotraj kvadrata

    % Generiranje naključnih x in y koordinat v kvadratu od -1 do 1
    x = -1 + 2 * rand(1, st_tock);
    y = -1 + 2 * rand(1, st_tock);

    % Preverimo, katere točke so znotraj kroga
    znotraj_kroga = (x.^2 + y.^2 <= 1);

    % Točke znotraj kvadrata so vedno označene kot znotraj
    znotraj_kvadrata = ones(1, st_tock);
end