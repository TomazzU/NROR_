% Programska datoteka za izračun števila π
function calc_pi_()
    st_tock = 10000; % Število naključnih točk za izračun
    r = 1; % Radij kroga
    
    [pi_ocena, napaka] = area_pi(st_tock, r); % Zagon funkcije za določitev ocene π in napake od dejanske vrednosti
    disp(['Ocenjeno π: ', num2str(pi_ocena)]);
    disp(['Napaka: ', num2str(napaka)]);
    
    vizualizacija(st_tock, r) % Zagon funkcije za vizualizacijjo problema
end

% Funkcija area_pi za določitev približka π in napake odstopanja od dejanske vrednosti
function [pi_ocena, napaka] = area_pi(st_tock, r)
    znotraj_kroga = 0;
    for i = 1:st_tock
        x = 2 * rand() - 1;
        y = 2 * rand() - 1;
        if x^2 + y^2 <= r^2
            znotraj_kroga = znotraj_kroga + 1;
        end
    
    pi_ocena = 4 * znotraj_kroga / st_tock;
    napaka = abs(pi - pi_ocena);
    fprintf('Število točk: %d, Ocena za π: %.6f, Napaka: %.6f\n', i, pi_ocena, napaka);
    end
 end

% Funkcija za izris naključnih točk te krožnice
function vizualizacija(st_tock, r)
    x = 2 * rand(st_tock, 1) - 1;
    y = 2 * rand(st_tock, 1) - 1;
    razdalja = sqrt(x.^2 + y.^2);
    tockeZnotraj = razdalja <= r;
    tockeZunaj = razdalja > r;
    scatter(x(tockeZnotraj), y(tockeZnotraj), 50, 'g', 'filled');
    hold on;
    scatter(x(tockeZunaj), y(tockeZunaj), 50, 'b', 'x');
    
    izrisi_kroznico();
    
    axis equal;
    % title('Naključno generirane točke na krožnici z lokom');
    % xlabel('X-os');
    % ylabel('Y-os');
    % legend('Znotraj krožnice', 'Zunaj krožnice', 'Krožnica');
end

% Funkcija za definiranje in izris krožnice z anonimno funkcijo
function izrisi_kroznico()
    r = 1;
    
    % Anonimna funkcija za definiranje krožnice
    kroznica = @(theta) [r * cos(theta); r * sin(theta)];
    theta = linspace(0, 2 * pi, 1000);
    tocke_kroznice = kroznica(theta);
    
    %Ukaz za izris krožnice
    plot(tocke_kroznice(1,:), tocke_kroznice(2,:), 'r', 'LineWidth', 2);
end